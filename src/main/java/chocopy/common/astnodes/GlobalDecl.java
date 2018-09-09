package chocopy.common.astnodes;

import java_cup.runtime.ComplexSymbolFactory.Location;

public class GlobalDecl extends Declaration {

    public final Identifier variable;

    public GlobalDecl(Location left, Location right, Identifier variable) {
        super(left, right);
        this.variable = variable;
    }
}
