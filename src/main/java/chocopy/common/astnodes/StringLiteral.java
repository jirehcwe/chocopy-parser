package chocopy.common.astnodes;

import java_cup.runtime.ComplexSymbolFactory.Location;

public final class StringLiteral extends Literal {

    public final String value;

    public StringLiteral(Location left, Location right, String value) {
        super(left, right);
        this.value = value;
    }
}
