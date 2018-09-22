package chocopy.common.astnodes;

import java_cup.runtime.ComplexSymbolFactory.Location;

public class VarAssignExpr extends Expr {
    public final Identifier var;
    public final Expr value;

    public VarAssignExpr(Location left, Location right, Identifier var, Expr value) {
        super(left, right);
        this.var = var;
        this.value = value;
    }
}
