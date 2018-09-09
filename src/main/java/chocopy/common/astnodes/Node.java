package chocopy.common.astnodes;

import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import java_cup.runtime.ComplexSymbolFactory.Location;

/**
 * Root of the AST class hierarchy.
 */
public abstract class Node {

    public final String kind;
    protected int leftLine;
    protected int leftCol;
    protected int rightLine;
    protected int rightCol;

    public Node(Location left, Location right) {
        if (left != null) {
            this.leftLine = left.getLine();
            this.leftCol = left.getColumn();
        }
        if (right != null) {
            this.rightLine = right.getLine();
            this.rightCol = right.getColumn();
        }
        this.kind = getClass().getSimpleName();
    }

    public String toJSON() throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        mapper.enable(SerializationFeature.INDENT_OUTPUT);
        return mapper.writeValueAsString(this);
    }

    public int[] getLocation() {
        return new int[]{ leftLine, leftCol, rightLine, rightCol} ;
    }

    /* Prints out the AST in JSON format */
    @Override
    public String toString() {
        try {
            return toJSON();
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
//        try {
//            return this.toString(0);
//        } catch(IllegalAccessException e) {
//            throw new RuntimeException(e);
//        }
    }

    private String tabs(int n) {
        String str = "";
        for (int i = 0; i < n; i++) {
            str += "  ";
        }
        return str;
    }

    private String quote(String str) {
        str = str.replace("\\", "\\\\");
        str = str.replace("\n", "\\n");
        str = str.replace("\t", "\\t");
        str = str.replace("\"", "\\\"");
        return '"' + str + '"';
    }


    @SuppressWarnings("unchecked")
    protected String toString(int depth) throws IllegalAccessException {
        String result = "";
        String endl = System.lineSeparator();

        result += "{" + endl;


        // Get all fields (including those declared in super-class)
        Field[] fields = this.getClass().getFields();

        // Move last field up (this is not important for semantics
        //   but makes reading the JSON easier, so that the "kind"
        //   field prints first).
        for (int i = fields.length-1; i > 0; i--) {
            Field tmp = fields[i];
            fields[i] = fields[i-1];
            fields[i-1] = tmp;
        }


        // Serialize key-value pairs
        depth++;
        for (int i = 0; i < fields.length; i++) {
            Field field = fields[i];
            boolean last = (i == fields.length-1);
            String key = field.getName();
            Object value = field.get(this);
            if (true) {
                result += tabs(depth);
                result += quote(key);
                result += ": ";
                if (value instanceof Node) {
                    result += ((Node) value).toString(depth);
                } else if (value instanceof String) {
                    result += quote((String) value);
                } else if (value instanceof Iterable) {
                    // We only support collections of AST nodes, e.g. List<Stmt>
                    Iterable<? extends Node> items = (Iterable<? extends Node>) value;
                    result += "[" + endl;
                    Iterator<? extends Node> it = items.iterator();
                    depth++;
                    while (it.hasNext()) {
                        Node item = it.next();
                        result += tabs(depth) + item.toString(depth);
                        if (it.hasNext()) {
                            result += ",";
                        }
                        result += endl;
                    }
                    depth--;
                    result += tabs(depth) + "]";
                } else {
                    result += value;
                }
                if (!last) {
                    result += ",";
                }
                result += endl;
            }

        }
        depth--;
        result += tabs(depth) + "}";

        return result;
    }
}
