package chocopy.common.astnodes;

import java_cup.runtime.ComplexSymbolFactory.Location;

public class Identifier extends Expr {

    public final String name;

    public Identifier(Location left, Location right, String name) {
        super(left, right);
        this.name = name;
    }
}
