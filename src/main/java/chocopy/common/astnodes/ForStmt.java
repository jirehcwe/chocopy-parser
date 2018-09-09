package chocopy.common.astnodes;

import java.util.List;

import java_cup.runtime.ComplexSymbolFactory.Location;

public class ForStmt extends Stmt {
    public final Identifier identifier;
    public final Expr iterable;
    public final List<Stmt> body;

    public ForStmt(Location left, Location right, Identifier identifier, Expr iterable, List<Stmt> body) {
        super(left, right);
        this.identifier = identifier;
        this.iterable = iterable;
        this.body = body;
    }
}
