package chocopy.common.astnodes;

import java_cup.runtime.ComplexSymbolFactory.Location;

public class VarAssignStmt extends Stmt {
    public final Identifier var;
    public final Expr value;

    public VarAssignStmt(Location left, Location right, Identifier var, Expr value) {
        super(left, right);
        this.var = var;
        this.value = value;
    }
}
