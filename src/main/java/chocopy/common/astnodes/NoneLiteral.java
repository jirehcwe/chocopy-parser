package chocopy.common.astnodes;

import java_cup.runtime.ComplexSymbolFactory.Location;

public final class NoneLiteral extends Literal {
    public NoneLiteral(Location left, Location right) {
        super(left, right);
    }
}
