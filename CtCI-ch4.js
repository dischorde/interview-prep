class Vertex {
  constructor(value) {
    this.value = value;
    this.inEdges = [];
    this.outEdges = [];
  }

  addInEdge(edge) {
    this.inEdges.push(edge);
  }

  addOutEdge(edge) {
    this.outEdges.push(edge);
  }

  removeInEdge(edge){
    let edgeIndex = this.inEdges.findIndex(edge);
    this.inEdges.splice(edgeIndex, 1);
  }

  removeOutEdge(edge) {
    let edgeIndex = this.outEdges.findIndex(edge);
    this.outEdges.splice(edgeIndex, 1);
  }
}

class Edge {
  constructor(fromVertex, toVertex) {
    this.fromVertex = fromVertex;
    this.toVertex = toVertex;
    fromVertex.addOutEdge(this);
    toVertex.addInEdge(this);
  }

  destroy() {
    this.fromVertex.removeOutEdge(this);
    this.toVertex.removeInEdge(this);
    this.fromVertex = null;
    this.toVertex = null;
  }
}

// make graph
let v0 = new Vertex(0);
let v1 = new Vertex(1);
let v2 = new Vertex(2);
let v3 = new Vertex(3);
let v4 = new Vertex(4);
let v5 = new Vertex(5);

let e1 = new Edge(v0, v1);
let e2 = new Edge(v2, v1);
let e3 = new Edge(v1, v4);
let e4 = new Edge(v1, v3);
let e5 = new Edge(v3, v4);
let e6 = new Edge(v0, v5);
let e7 = new Edge(v0, v4);
let e8 = new Edge(v3, v2);

// graph problems
const routeBetween = (n1, n2) => {
  // using bidirectional search
  let visited1 = new Set();
  let visited2 = new Set();
  let queue1 = [n1];
  let queue2 = [n2];
  visited1.add(n1);
  visited2.add(n2);

  while (queue1.length > 0 || queue2.length > 0) {
    let check1 = queue1.shift();
    let check2 = queue2.shift();

    if (check1 === n2 || check2 === n1) {
      return true;
    }

    if (check1 !== undefined) {
      check1.outEdges.forEach(edge => {
        if (!visited1.has(edge.toVertex)) {
          queue1.push(edge.toVertex);
          visited1.add(edge.toVertex);
        }
      });
    }

    if (check2 !== undefined) {
      check2.outEdges.forEach(edge => {
        if (!visited2.has(edge.toVertex)) {
          queue2.push(edge.toVertex);
          visited2.add(edge.toVertex);
        }
      });
    }

  }
  return false;
};
