package me.loki2302

import groovy.transform.ToString
import org.codehaus.groovy.control.CompilerConfiguration

class App {
    static void main(String[] args) {
        CV cv = new CV()

        Binding binding = new Binding()
        binding.setVariable("cv", cv)

        CompilerConfiguration compilerConfiguration = new CompilerConfiguration()
        compilerConfiguration.setScriptBaseClass(CVScriptBase.name)

        GroovyShell groovyShell = new GroovyShell(binding, compilerConfiguration)
        groovyShell.evaluate(new File("loki2302.cv"))
        /*groovyShell.evaluate('''

basic {
    name 'loki2302'
    position 'developer'
}

project {
    name 'Project One'
    summary 'Summary for project one'

    point 'Developed lots of stuff'
    point 'Fixed lots of bugs'
}

project {
    name 'Project Two'
    summary 'Summary for project two'

    point 'Coordinated lots of activities'
}

''')*/

        printCV cv
    }

    static void printCV(CV cv) {
        println 'CV'
        println cv.basic.name
        println cv.basic.position
        println()

        cv.projects.each {
            println it.name
            println it.summary
            it.points.each {
                println it
            }
            println()
        }
    }

    static abstract class CVScriptBase extends Script {
        void basic(Closure closure) {
            Basic basic = new Basic()
            closure.delegate = basic
            closure()

            CV cv = (CV)getBinding().getVariable("cv")
            cv.basic = basic
        }

        void project(Closure closure) {
            Project project = new Project()
            closure.delegate = project
            closure()

            CV cv = (CV)getBinding().getVariable("cv")
            List<Project> projects = cv.projects
            projects.add(project)
        }
    }

    @ToString
    static class CV {
        Basic basic
        List<Project> projects = []
    }

    @ToString(includeNames = true)
    static class Basic {
        String name
        String position

        def name(name) {
            this.name = name
        }

        def position(position) {
            this.position = position
        }
    }

    @ToString(includeNames = true)
    static class Project {
        String name
        String summary
        List<String> points = []

        def name(name) {
            this.name = name
        }

        def summary(summary) {
            this.summary = summary
        }

        def point(point) {
            points.add(point)
        }
    }
}
