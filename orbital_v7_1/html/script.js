document.addEventListener('DOMContentLoaded', () => {
    // Initialize Stats
    document.getElementById('stats-nodes').textContent = RAW_NODES.length;
    document.getElementById('stats-edges').textContent = RAW_EDGES.length;

    // Prepare elements for Cytoscape
    const elements = [];
    RAW_NODES.forEach(n => {
        elements.push({ 
            data: { 
                id: n.id, 
                label: n.label, 
                color: n.color,
                namespace: n.namespace, 
                lines: n.lines, 
                title: n.title,
                size: Math.max(30, Math.min(80, 20 + n.lines * 0.5)) 
            }
        });
    });
    
    RAW_EDGES.forEach(e => {
        elements.push({ 
            data: { source: e.from, target: e.to }
        });
    });

    // Initialize Cytoscape
    const cy = cytoscape({
        container: document.getElementById('cy'),
        elements: elements,
        style: [
            {
                selector: 'node',
                style: {
                    'background-color': 'data(color)',
                    'label': 'data(label)',
                    'color': '#f4f4f5',
                    'font-family': "'JetBrains Mono', monospace",
                    'font-size': '10px',
                    'text-valign': 'bottom',
                    'text-halign': 'center',
                    'text-margin-y': 6,
                    'width': 'data(size)',
                    'height': 'data(size)',
                    'border-width': 2,
                    'border-color': 'rgba(255,255,255,0.1)',
                    'text-background-color': 'rgba(0,0,0,0.6)',
                    'text-background-opacity': 1,
                    'text-background-padding': '4px',
                    'text-background-shape': 'roundrectangle',
                    'transition-property': 'background-color, border-color, width, height',
                    'transition-duration': '0.3s'
                }
            },
            {
                selector: 'node:selected',
                style: {
                    'border-color': '#fff',
                    'border-width': 4,
                    'shadow-blur': 20,
                    'shadow-color': 'data(color)',
                    'shadow-opacity': 0.8
                }
            },
            {
                selector: 'edge',
                style: {
                    'width': 1.5,
                    'line-color': 'rgba(255,255,255,0.1)',
                    'target-arrow-color': 'rgba(255,255,255,0.2)',
                    'target-arrow-shape': 'chevron',
                    'curve-style': 'bezier',
                    'arrow-scale': 1.2,
                    'transition-property': 'line-color, target-arrow-color, width',
                    'transition-duration': '0.3s'
                }
            },
            {
                selector: '.highlighted-edge',
                style: { 
                    'line-color': '#3b82f6', 
                    'target-arrow-color': '#3b82f6', 
                    'width': 3,
                    'z-index': 99
                }
            },
            {
                selector: '.highlighted-edge-caller',
                style: { 
                    'line-color': '#f59e0b', 
                    'target-arrow-color': '#f59e0b', 
                    'width': 3,
                    'z-index': 99
                }
            },
            {
                selector: '.faded',
                style: { 
                    'opacity': 0.1 
                }
            }
        ],
        layout: { 
            name: 'cose', 
            animate: true, 
            animationDuration: 1000,
            nodeRepulsion: 10000, 
            edgeElasticity: 100,
            idealEdgeLength: 100, 
            padding: 50, 
            randomize: true 
        }
    });

    // Event Listeners
    cy.on('tap', 'node', function(evt){
        const node = evt.target;
        openPanel(node);
    });

    cy.on('tap', function(evt){
        if(evt.target === cy) { 
            resetHighlight(); 
            closePanel(); 
        }
    });

    // Panel Logic
    const infoPanel = document.getElementById('info-panel');
    
    document.getElementById('close-panel').addEventListener('click', closePanel);

    function openPanel(node) {
        const id = node.id();
        document.getElementById('panel-title').textContent = id;
        document.getElementById('panel-lines').textContent = node.data('lines');
        document.getElementById('panel-ns').textContent = node.data('namespace');

        const callsList = document.getElementById('panel-calls');
        const callersList = document.getElementById('panel-callers');
        callsList.innerHTML = '';
        callersList.innerHTML = '';

        const outgoing = cy.edges().filter(e => e.data('source') === id);
        const incoming = cy.edges().filter(e => e.data('target') === id);

        outgoing.forEach(e => {
            const li = document.createElement('li');
            li.textContent = e.data('target');
            li.onclick = () => { cy.getElementById(e.data('target')).trigger('tap'); };
            callsList.appendChild(li);
        });

        incoming.forEach(e => {
            const li = document.createElement('li');
            li.textContent = e.data('source');
            li.onclick = () => { cy.getElementById(e.data('source')).trigger('tap'); };
            callersList.appendChild(li);
        });

        if(outgoing.length === 0) callsList.innerHTML = '<li style="pointer-events:none;color:#64748b;background:transparent;border:none;">Нет вызовов</li>';
        if(incoming.length === 0) callersList.innerHTML = '<li style="pointer-events:none;color:#64748b;background:transparent;border:none;">Никто не вызывает</li>';

        // Highlight connected
        resetHighlight();
        
        cy.elements().addClass('faded');
        node.removeClass('faded');
        
        outgoing.forEach(e => {
            e.removeClass('faded').addClass('highlighted-edge');
            e.target().removeClass('faded');
        });
        
        incoming.forEach(e => {
            e.removeClass('faded').addClass('highlighted-edge-caller');
            e.source().removeClass('faded');
        });

        infoPanel.classList.remove('hidden');
        
        // Smooth center on node
        cy.animate({
            center: { eles: node },
            zoom: 1.2,
            duration: 400,
            easing: 'ease-out-cubic'
        });
    }

    function closePanel() {
        infoPanel.classList.add('hidden');
        resetHighlight();
    }

    function resetHighlight() {
        cy.elements().removeClass('faded highlighted-edge highlighted-edge-caller');
    }

    // Controls
    document.getElementById('btn-fit').addEventListener('click', () => {
        cy.animate({ fit: { padding: 50 }, duration: 400 });
    });
    
    document.getElementById('btn-zoom-in').addEventListener('click', () => {
        cy.animate({ zoom: cy.zoom() * 1.5, center: { x: cy.width()/2, y: cy.height()/2 }, duration: 200 });
    });
    
    document.getElementById('btn-zoom-out').addEventListener('click', () => {
        cy.animate({ zoom: cy.zoom() * 0.7, center: { x: cy.width()/2, y: cy.height()/2 }, duration: 200 });
    });
    
    document.getElementById('btn-reset').addEventListener('click', () => {
        closePanel();
        cy.animate({ fit: { padding: 50 }, duration: 400 });
    });

    // Search
    document.getElementById('search').addEventListener('input', function() {
        const q = this.value.toLowerCase().trim();
        if (!q) { 
            resetHighlight(); 
            return; 
        }
        
        cy.elements().addClass('faded');
        const matched = cy.nodes().filter(n => n.id().toLowerCase().includes(q));
        matched.removeClass('faded');
        
        matched.connectedEdges().removeClass('faded').addClass('highlighted-edge');
        matched.neighborhood().removeClass('faded');
        
        if (matched.length > 0 && matched.length < 20) {
            cy.animate({ fit: { eles: matched, padding: 100 }, duration: 400 });
        }
    });
});
