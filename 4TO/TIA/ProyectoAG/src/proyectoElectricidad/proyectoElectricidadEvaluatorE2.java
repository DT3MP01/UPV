package proyectoElectricidad;

import java.util.ArrayList;
import org.opt4j.core.Objectives;
import org.opt4j.core.Objective.Sign;
import org.opt4j.core.problem.Evaluator;

public class proyectoElectricidadEvaluatorE2 implements Evaluator<ArrayList<Integer>> 
{
	public Objectives evaluate (ArrayList<Integer> phenotype) {
		double beneficio = 0;
		int productos = 0;
		double [] potenciaActual = new double[DatosElectricidad.NUM_TRAMOS+1];
		int tramo;
		int bonus=10;
		boolean hayBonus= false;
		int bonusMismoTramo = 5;
		int penalizacionMismoTramo= -100;
		for( int i=0 ; i<phenotype.size();++i)
		{
			tramo = phenotype.get(i);
			// Condicion tener suficiente potencia en ese tramo
			if (tramo!= 0 && potenciaActual[tramo]+DatosElectricidad.consumo[i]>DatosElectricidad.potenciaMaximaTramo[tramo])
			{
				// Si no hay suficiente potencia se deja para la siguiente jornada laboral penalizando su beneficio
				phenotype.set(i, 0);
				tramo = 0;
			}
			
			
			// Para aquellos productos que no se han dejado para la proxima jornada laborar
			if(tramo > 0 )
			{
				potenciaActual[tramo] += DatosElectricidad.consumo[i];
				if ( tramo==1 || tramo == 2) {
					productos++;
				}
				beneficio += DatosElectricidad.beneficio[i] - (DatosElectricidad.consumo[i]*
						DatosElectricidad.horasTramo[tramo] * DatosElectricidad.preciokWhTramo[tramo]);
			}
			
			
		}
		for( int i=1 ; i<DatosElectricidad.NUM_TRAMOS;++i)
		{
			tramo = phenotype.get(i);
			if(potenciaActual[tramo]< DatosElectricidad.potenciaMaximaTramo[i]*0.9 )
			{
				hayBonus = true;
			}
		}
		if(hayBonus) {
			beneficio += bonus;
		}
		
		if(phenotype.get(2-1) == phenotype.get(3-1) && phenotype.get(3-1) == phenotype.get(7-1) ) {
			beneficio+= bonusMismoTramo;
		}
		
		if(phenotype.get(10-1) == phenotype.get(12-1) ) {
			beneficio+= penalizacionMismoTramo;
		}
	Objectives objectives = new Objectives();
	objectives.add("Beneficio-MAX",Sign.MAX,beneficio);
	objectives.add("Productos-MAX",Sign.MAX,productos);
	return objectives;
	}
	
}
