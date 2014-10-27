package me.loki2302.meta

import org.codehaus.groovy.ast.ASTNode
import org.codehaus.groovy.ast.MethodNode
import org.codehaus.groovy.ast.builder.AstBuilder
import org.codehaus.groovy.ast.stmt.Statement
import org.codehaus.groovy.control.CompilePhase
import org.codehaus.groovy.control.SourceUnit
import org.codehaus.groovy.transform.ASTTransformation
import org.codehaus.groovy.transform.GroovyASTTransformation

@GroovyASTTransformation(phase = CompilePhase.SEMANTIC_ANALYSIS)
public class PrependPrintlnASTTransformation implements ASTTransformation {
    @Override
    void visit(ASTNode[] nodes, SourceUnit source) {
        if(!nodes) {
            return
        }

        println 'Applying AST transformation!'

        MethodNode methodNode = (MethodNode)nodes[1]
        Statement methodCode = methodNode.getCode()

        methodCode.getStatements().add(0, new AstBuilder().buildFromCode {
            println 'I am AST transformation'
            return
        }[0].getStatements()[0])
    }
}
