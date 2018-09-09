package chocopy.common.astnodes;

import java_cup.runtime.ComplexSymbolFactory.Location;

public class ReturnStmt extends Stmt {

    public final Expr value;

    public ReturnStmt(Location left, Location right, Expr value) {
        super(left, right);
        this.value = value;
    }
}
