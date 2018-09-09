package chocopy.common.astnodes;

import java_cup.runtime.ComplexSymbolFactory.Location;

/** A statement containing only an expression. */
public final class ExprStmt extends Stmt {

    public final Expr expr;

    public ExprStmt(Location left, Location right, Expr expr) {
        super(left, right);
        this.expr = expr;
    }
}
