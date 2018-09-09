package chocopy.common.astnodes;

import java_cup.runtime.ComplexSymbolFactory.Location;

public class MemberExpr extends Expr {

    public final Expr object;
    public final Identifier member;

    public MemberExpr(Location left, Location right, Expr object, Identifier member) {
        super(left, right);
        this.object = object;
        this.member = member;
    }
}
