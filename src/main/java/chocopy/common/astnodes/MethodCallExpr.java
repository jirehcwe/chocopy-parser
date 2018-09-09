package chocopy.common.astnodes;

import java_cup.runtime.ComplexSymbolFactory.Location;

import java.util.List;

public class MethodCallExpr extends Expr {

    public final MemberExpr method;
    public final List<Expr> args;

    public MethodCallExpr(Location left, Location right, MemberExpr method, List<Expr> args) {
        super(left, right);
        this.method = method;
        this.args = args;
    }
}
