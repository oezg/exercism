import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Map;

public class Graph {
  private final Collection<Node> nodes;
  private final Collection<Edge> edges;
  private final Map<String, String> attributes;

  public Graph() {
    this(Map.of());
  }

  public Graph(Map<String, String> attributes) {
    this.nodes = new ArrayList<>();
    this.edges = new ArrayList<>();
    this.attributes = attributes;
  }

  public Collection<Node> getNodes() {
    return Collections.unmodifiableCollection(nodes);
  }

  public Collection<Edge> getEdges() {
    return Collections.unmodifiableCollection(edges);
  }

  public Graph node(String name) {
    nodes.add(new Node(name));
    return this;
  }

  public Graph node(String name, Map<String, String> attributes) {
    nodes.add(new Node(name, attributes));
    return this;
  }

  public Graph edge(String start, String end) {
    edges.add(new Edge(start, end));
    return this;
  }

  public Graph edge(String start, String end, Map<String, String> attributes) {
    edges.add(new Edge(start, end, attributes));
    return this;
  }

  public Map<String, String> getAttributes() {
    return Collections.unmodifiableMap(attributes);
  }
}
