package chocopy.common.astnodes;

import java_cup.runtime.ComplexSymbolFactory.Location;

public class TypedVar extends Node {

    public final Identifier identifier;
    public final TypeAnnotation type;

    public TypedVar(Location left, Location right, Identifier identifier, TypeAnnotation type) {
        super(left, right);
        this.identifier = identifier;
        this.type = type;
    }
}
