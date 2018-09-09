package chocopy.common.astnodes;

import java_cup.runtime.ComplexSymbolFactory.Location;

/** Integer literal */
public final class IntegerLiteral extends Literal {

    public final int value;

    public IntegerLiteral(Location left, Location right, int value) {
        super(left, right);
        this.value = value;
    }
}
