package chocopy.common.astnodes;

import java_cup.runtime.ComplexSymbolFactory.Location;

public final class BooleanLiteral extends Literal {

    public final boolean value;

    public BooleanLiteral(Location left, Location right, boolean value) {
        super(left, right);
        this.value = value;
    }
}
