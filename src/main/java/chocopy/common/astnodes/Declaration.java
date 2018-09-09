package chocopy.common.astnodes;

import java_cup.runtime.ComplexSymbolFactory.Location;

/**
 * Base of all AST nodes representing definitions or declarations.
 */
public abstract class Declaration extends Node {
    public Declaration(Location left, Location right) {
        super(left, right);
    }
}
