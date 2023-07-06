package proyectoElectricidad;

import org.opt4j.core.problem.ProblemModule;

public class proyectoElectricidadModule extends ProblemModule 
{
	protected void config() 
	{
		bindProblem(proyectoElectricidadCreator.class, proyectoElectricidadDecoder.class, proyectoElectricidadEvaluatorE2.class);
	}

}