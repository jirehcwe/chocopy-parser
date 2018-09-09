package chocopy.common.astnodes;

import java.util.List;

import java_cup.runtime.ComplexSymbolFactory.Location;

public class ClassDef extends Declaration {
    public final Identifier name;
    public final Identifier superClass;
    public final List<Declaration> declarations;

    public ClassDef(Location left, Location right, Identifier name, Identifier superClass, List<Declaration> declarations) {
        super(left, right);
        this.name = name;
        this.superClass = superClass;
        this.declarations = declarations;
    }
}
