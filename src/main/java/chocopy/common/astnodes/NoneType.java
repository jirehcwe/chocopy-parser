package chocopy.common.astnodes;

import java_cup.runtime.ComplexSymbolFactory.Location;

public final class NoneType extends TypeAnnotation {
    public NoneType(Location left, Location right) {
        super(left, right);
    }
}