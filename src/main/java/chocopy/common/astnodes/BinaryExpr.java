package chocopy.common.astnodes;

import java_cup.runtime.ComplexSymbolFactory.Location;

/**
 * An expression with two operands and an operator.
 */
public class BinaryExpr extends Expr {

    public final Expr left;
    public final String operator;
    public final Expr right;

    public BinaryExpr(Location leftLoc, Location rightLoc, Expr leftExpr, String operator, Expr rightExpr) {
        super(leftLoc, rightLoc);
        this.left = leftExpr;
        this.operator = operator;
        this.right = rightExpr;
    }
}
