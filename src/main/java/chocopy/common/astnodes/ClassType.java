package chocopy.common.astnodes;

import java_cup.runtime.ComplexSymbolFactory.Location;

public final class ClassType extends TypeAnnotation {

    public final String className;

    public ClassType(Location left, Location right, String className) {
        super(left, right);
        this.className = className;
    }
}