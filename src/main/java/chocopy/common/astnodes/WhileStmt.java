package chocopy.common.astnodes;

import java_cup.runtime.ComplexSymbolFactory.Location;

import java.util.List;

public class WhileStmt extends Stmt {
    public final Expr condition;
    public final List<Stmt> body;

    public WhileStmt(Location left, Location right, Expr condition, List<Stmt> body) {
        super(left, right);
        this.condition = condition;
        this.body = body;
    }
}
