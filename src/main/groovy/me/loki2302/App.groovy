package me.loki2302

import groovy.transform.ToString
import org.codehaus.groovy.control.CompilerConfiguration

class App {
    static void main(String[] args) {
        Binding binding = new Binding()
        binding.setVariable("basic", new Basic())
        binding.setVariable("projects", new ArrayList<Project>());

        CompilerConfiguration compilerConfiguration = new CompilerConfiguration()
        compilerConfiguration.setScriptBaseClass(CVScriptBase.name)

        GroovyShell groovyShell = new GroovyShell(binding, compilerConfiguration)
        groovyShell.evaluate('''

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

''')

        Basic basic = (Basic)binding.getVariable("basic")
        println basic

        List<Project> projects = (List<Project>)binding.getVariable("projects")
        println projects
    }

    static abstract class CVScriptBase extends Script {
        void basic(Closure closure) {
            Basic basic = (Basic)getBinding().getVariable("basic")
            closure.delegate = basic
            closure()
        }

        void project(Closure closure) {
            Project project = new Project()
            closure.delegate = project
            closure()

            List<Project> projects = (List<Project>)getBinding().getVariable("projects")
            projects.add(project)
        }
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
