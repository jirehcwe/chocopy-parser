package chocopy.common.astnodes;

import java_cup.runtime.ComplexSymbolFactory.Location;


public class SyntaxError extends Node {
    public final String message;

    public SyntaxError(Location left, Location right, String message) {
        super(left, right);
        this.message = message;
    }
}
