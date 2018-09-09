package chocopy.common.astnodes;

import java_cup.runtime.ComplexSymbolFactory.Location;

public class UnaryExpr extends Expr {

    public final String operator;
    public final Expr operand;

    public UnaryExpr(Location left, Location right, String operator, Expr operand) {
        super(left, right);
        this.operator = operator;
        this.operand = operand;
    }
}
