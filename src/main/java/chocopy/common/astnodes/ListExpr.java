package chocopy.common.astnodes;

import java.util.List;

import java_cup.runtime.ComplexSymbolFactory.Location;

public final class ListExpr extends Expr {

    public final List<Expr> elements;

    public ListExpr(Location left, Location right, List<Expr> elements) {
        super(left, right);
        this.elements = elements;
    }
}
