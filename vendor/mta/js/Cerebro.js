var Cerebro = {};

Cerebro.brainJson = {};
Cerebro.plan = {};
Cerebro.salida = {};
Cerebro.resumen = {};
Cerebro.turnos = {};
Cerebro.email = "fatapia@scipion.cl";
Cerebro.caso = {};

Cerebro.enviarDatos = function(datos)
{
	this.plan = datos;
	var respuesta = "";
	this.caso = Cerebro.plan.id_caso;
	this.salida = enviar_datos_api_ajax("ver_salida", this.caso, this.email);
	this.setearResumen();
	return this.brainJson;
}

Cerebro.productividadDiaria = function()
{
	sumatoriaTurnosDiaria = this.sumatoriaTurnosDiaria();

	if (Object.keys(Cerebro.plan).length !== 0)
	{		
		plan_venta_in = this.plan.datos.plan_venta.split(", [");
		plan_venta_in[0] = plan_venta_in[0].replace("[", "");
		num_horas_dia_in =  this.plan.datos.num_horas_dia;
		num_dias_ventana = this.plan.datos.num_dias_ventana;
		//sacar el plan de venta diario

		var plan_venta_diario = new Array(num_dias_ventana);

		//inicializar en 0

		for (var i = 0; i < plan_venta_in.length; i++) 
		{
		    plan_hora = plan_venta_in[i].split("] ")
		    plan_venta_diario[parseInt(plan_hora[0].split(",")[2])-1] = 0;
		}
		//sumatoria por día 

		for (var i = 0; i < plan_venta_in.length; i++) 
		{
		    plan_hora = plan_venta_in[i].split("] ")
		    plan_venta_diario[parseInt(plan_hora[0].split(",")[2])-1] += parseFloat(plan_hora[1]);
		}

		for (var i = 0; i < plan_venta_diario.length; i++) 
		{
			plan_venta_diario[i] =  Math.round(parseInt(plan_venta_diario[i]) / parseInt(sumatoriaTurnosDiaria[i]));
		}
	}
	else
	{
		plan_venta_in = "";
	}
	return plan_venta_diario;
}
Cerebro.cacularProductividad = function(mes)
{
	sumatoriaTurnosDiaria = this.sumatoriaTurnosDiaria();
	productividadMes = [];
	for (var i = 0; i < mes.length; i++) 
	{
		productividadMes[i] =  Math.round(parseInt(mes[i]) / parseInt(sumatoriaTurnosDiaria[i]));
	}

	return productividadMes;
}

Cerebro.calcularProductividadReal = function(mes)
{
	sumatoriaTurnosDiaria = Cerebro.sumatoriaTurnosDiaria();
	productividadMes = [];
	for (var i = 0; i < mes.length; i++) 
	{
		productividadMes[i] =  Math.round(parseInt(mes[i]) / parseInt(sumatoriaTurnosDiaria[i]));
	}

	return productividadMes;
}
Cerebro.productividadOptimizada = function()
{
	sumatoriaTurnosDiaria = this.sumatoriaTurnosOptimizado();

	if (Object.keys(Cerebro.plan).length !== 0)
	{		
		plan_venta_in = this.plan.datos.plan_venta.split(", [");
		plan_venta_in[0] = plan_venta_in[0].replace("[", "");
		num_horas_dia_in =  this.plan.datos.num_horas_dia;
		num_dias_ventana = this.plan.datos.num_dias_ventana;
		//sacar el plan de venta diario

		var plan_venta_diario = new Array(num_dias_ventana);

		//inicializar en 0

		for (var i = 0; i < plan_venta_in.length; i++) 
		{
		    plan_hora = plan_venta_in[i].split("] ")
		    plan_venta_diario[parseInt(plan_hora[0].split(",")[2])-1] = 0;
		}
		//sumatoria por día 

		for (var i = 0; i < plan_venta_in.length; i++) 
		{
		    plan_hora = plan_venta_in[i].split("] ")
		    plan_venta_diario[parseInt(plan_hora[0].split(",")[2])-1] += parseFloat(plan_hora[1]);
		}

		for (var i = 0; i < plan_venta_diario.length; i++) 
		{
			plan_venta_diario[i] =  Math.round(parseInt(plan_venta_diario[i]) / parseInt(sumatoriaTurnosDiaria[i]));
		}
	}
	else
	{
		plan_venta_in = "";
	}
	return plan_venta_diario;
}
Cerebro.planVentaOptimizada = function()
{
	if (Object.keys(Cerebro.plan).length !== 0)
	{		
		plan_venta_in = this.plan.datos.plan_venta.split(", [");
		plan_venta_in[0] = plan_venta_in[0].replace("[", "");
		num_horas_dia_in =  this.plan.datos.num_horas_dia;
		num_dias_ventana = this.plan.datos.num_dias_ventana;
		//sacar el plan de venta diario

		var plan_venta_diario = new Array(num_dias_ventana);

		//inicializar en 0

		for (var i = 0; i < plan_venta_in.length; i++) 
		{
		    plan_hora = plan_venta_in[i].split("] ")
		    plan_venta_diario[parseInt(plan_hora[0].split(",")[2])-1] = 0;
		}
		//sumatoria por día 

		for (var i = 0; i < plan_venta_in.length; i++) 
		{
		    plan_hora = plan_venta_in[i].split("] ")
		    plan_venta_diario[parseInt(plan_hora[0].split(",")[2])-1] += parseFloat(plan_hora[1]);
		}

		for (var i = 0; i < plan_venta_diario.length; i++) 
		{
			plan_venta_diario[i] =  Math.round(parseInt(plan_venta_diario[i]));
		}
	}
	else
	{
		plan_venta_in = "";
	}
	return plan_venta_diario;
}

Cerebro.productividadObjetivo = function()
{
	num_dias_ventana = this.plan.datos.num_dias_ventana;
	var plan_venta_diario = new Array(num_dias_ventana);

	for (var i = 0; i < plan_venta_in.length; i++) 
	{
	    plan_hora = plan_venta_in[i].split("] ")
	    plan_venta_diario[i] = Cerebro.plan.datos.prod_obj;
	}	
	return plan_venta_diario;
}

Cerebro.productividadIdeal = function()
{
	sumatoriaTurnosDiaria = this.sumatoriaTurnosOptimizado();
	deltas = Cerebro.calcularPerdida(Cerebro.calcularDelta());
	if (Object.keys(Cerebro.plan).length !== 0)
	{		
		plan_venta_in = this.plan.datos.plan_venta.split(", [");
		plan_venta_in[0] = plan_venta_in[0].replace("[", "");
		num_horas_dia_in =  this.plan.datos.num_horas_dia;
		num_dias_ventana = this.plan.datos.num_dias_ventana;
		//sacar el plan de venta diario

		var plan_venta_diario = new Array(num_dias_ventana);

		//inicializar en 0

		for (var i = 0; i < plan_venta_in.length; i++) 
		{
		    plan_hora = plan_venta_in[i].split("] ")
		    plan_venta_diario[parseInt(plan_hora[0].split(",")[2])-1] = 0;
		}
		//sumatoria por día 

		for (var i = 0; i < plan_venta_in.length; i++) 
		{
		    plan_hora = plan_venta_in[i].split("] ")
		    plan_venta_diario[parseInt(plan_hora[0].split(",")[2])-1] += parseFloat(plan_hora[1]);
		}

		for (var i = 0; i < plan_venta_diario.length; i++) 
		{
			plan_venta_diario[i] =  Math.round((parseFloat(plan_venta_diario[i] - deltas[i] ))/ parseFloat(sumatoriaTurnosDiaria[i]));
		}
	}
	else
	{
		plan_venta_in = "";
	}
	return plan_venta_diario;
}

Cerebro.planVentaDiario = function()
{
	if (Object.keys(Cerebro.plan).length !== 0)
	{		
		plan_venta_in = this.plan.datos.plan_venta.split(", [");
		plan_venta_in[0] = plan_venta_in[0].replace("[", "");
		num_horas_dia_in =  this.plan.datos.num_horas_dia;
		num_dias_ventana = this.plan.datos.num_dias_ventana;
		//sacar el plan de venta diario

		var plan_venta_diario = new Array(num_dias_ventana);

		console.log(plan_venta_diario);
		//inicializar en 0

		for (var i = 0; i < plan_venta_in.length; i++) 
		{
		    plan_hora = plan_venta_in[i].split("] ")
		    plan_venta_diario[parseInt(plan_hora[0].split(",")[2])-1] = 0;
		}
		//sumatoria por día 

		for (var i = 0; i < plan_venta_in.length; i++) 
		{
		    plan_hora = plan_venta_in[i].split("] ")
		    plan_venta_diario[parseInt(plan_hora[0].split(",")[2])-1] += parseFloat(plan_hora[1]);
		}
	}
	else
	{
		plan_venta_in = "";
	}
	return plan_venta_diario;
}

Cerebro.calcularAlmuerzos = function()
{
	if (Object.keys(Cerebro.brainJson).length !== 0)
	{
		almuerzos = this.brainJson.resultado.almuerzos.split(", [");

		deltas = this.brainJson.resultado.delta.split(", [");
		deltas[0] = deltas[0].replace("[", "");


		epsilons = this.brainJson.resultado.epsilon.split(", [");
		matrixAlmuerzo = new Array();
		matrixAlfaD = new Array();
		horasDiarias = 10;
		diaSemana = 1; 
		count = 1;


		matrixSemanaE = new Array(28);



		for (var i = almuerzos.length - 1; i >= 0; i--) 
		{
		  almuerzo = almuerzos[i].split('] '); 
		  matrixAlmuerzo[almuerzo[0].replace("[", "").split(',')[2]] = almuerzo[1];
		}
	}
	else
	{
		matrixAlmuerzo = "";
	}

	return matrixAlmuerzo;
}

Cerebro.calcularDelta = function()
{
	if (Object.keys(Cerebro.brainJson).length !== 0)
	{
		almuerzos = this.brainJson.resultado.almuerzos.split(", [");

		deltas = this.brainJson.resultado.delta.split(", [");
		deltas[0] = deltas[0].replace("[", "");


		epsilons = this.brainJson.resultado.epsilon.split(", [");
		matrixAlmuerzo = new Array();
		matrixAlfaD = new Array();
		horasDiarias = 10;
		diaSemana = 1; 
		count = 1;


		matrixSemanaE = new Array(28);



		for (var i = almuerzos.length - 1; i >= 0; i--) 
		{
		  almuerzo = almuerzos[i].split('] '); 
		  matrixAlmuerzo[almuerzo[0].replace("[", "").split(',')[2]] = almuerzo[1];
		}

		for (var i = deltas.length - 1; i >= 0; i--) 
		{ 
		  delta = deltas[i].split("] ");
		  matrixAlfaD[delta[0].split(',')[1]] = delta[1];
		}
	}
	else
	{
		matrixAlfaD = "";
	}

	return matrixAlfaD;
}


Cerebro.calcularEpsilon = function()
{
	if (Object.keys(Cerebro.brainJson).length !== 0)
	{
		almuerzos = this.brainJson.resultado.almuerzos.split(", [");
		deltas = this.brainJson.resultado.delta.split(", [");
		deltas[0] = deltas[0].replace("[", "");
		epsilons = this.brainJson.resultado.epsilon.split(", [");

		matrixAlmuerzo = new Array();
		matrixAlfaE = new Array();
		horasDiarias = 10;
		diaSemana = 1; 
		count = 1;

		matrixSemanaE = new Array(28);

		for (var i = almuerzos.length - 1; i >= 0; i--) 
		{
		  almuerzo = almuerzos[i].split('] '); 
		  matrixAlmuerzo[almuerzo[0].replace("[", "").split(',')[2]] = almuerzo[1];
		}

		for (var i = epsilons.length - 1; i >= 0; i--) {
		  epsilon = epsilons[i].split("] ");
		  matrixAlfaE[epsilon[0].replace("[", "").split(',')[1]] = -epsilon[1];
		}
	}
	else
	{
		matrixAlfaE = "";
	}

	
	return matrixAlfaE;

}

Cerebro.totalDeTurnos = function()
{
	if (Object.keys(Cerebro.plan).length !== 0)
	{	
		////////////////////////////////////////////////////////////////
		// Matriz de turnos
		////////////////////////////////////////////////////////////////

		matriz_turnos = this.plan.datos.matriz_turnos.split(", [");
		matriz_turnos[0] = matriz_turnos[0].replace("[", "");
		num_turnos = plan.datos.num_turnos;

		matriz_turnos_in = Array();

		for (var i = 0; i < matriz_turnos.length; i++) 
		{
		  turno = matriz_turnos[i].split("] ")[0];
		  turno_1 = matriz_turnos[i].split("] ")[1];
		  coordenadas = turno.split(",");
		  matriz_turnos_in[i] = { turno: coordenadas[0], hora: coordenadas[1], dia: coordenadas[2] , valor : parseFloat(turno_1)};
		}

		//////////////// dotacion real //////////////////////////////////

		dotacion_real = this.plan.datos.dotacion_real.split(", [");
		dotacion_real[0] = dotacion_real[0].replace("[", "");

		matriz_dotacion_real = Array();

		for (var i = 0; i < dotacion_real.length; i++)
		{
		  dotacion = dotacion_real[i].split("] ")[0];
		  dotacion_cantidad = dotacion_real[i].split("] ")[1];
		  coordenadas = dotacion.split(",");
		  matriz_dotacion_real[i] = {turno: coordenadas[0], x: coordenadas[1], y: coordenadas[2], cantidad: dotacion_cantidad};
		}


		//////////////////////////////////////////////////////////////////
		// sumatoria de turnos total 
		//////////////////////////////////////////////////////////////////

		dia = 0; // maximo  plan.datos.num_dias_ventana
		hora = 0; // máximo plan.datos.num_horas_dia

		sumatoria_turnos = Array(this.plan.datos.num_dias_ventana * this.plan.datos.num_horas_dia);

		for (var i = 0; i < sumatoria_turnos.length; i++) 
		{
		  sumatoria_turnos[i] = 0;
		}

		for (var i = 0; i < matriz_turnos_in.length; i++) 
		{
		  hora_turno = matriz_turnos_in[i];
		  coordenada = parseFloat((hora_turno.dia-1)*10) + parseFloat(hora_turno.hora) - 1;
		  sumatoria_turnos[coordenada] += 1;
		}
	}
	else
	{
		sumatoria_turnos = "";
	}

	return sumatoria_turnos;
}

Cerebro.totalTurnosReales = function()
{
	if (Object.keys(Cerebro.plan).length !== 0)
	{
		////////////////////////////////////////////////////////////////
		// Matriz de turnos
		////////////////////////////////////////////////////////////////

		matriz_turnos = this.plan.datos.matriz_turnos.split(", [");
		matriz_turnos[0] = matriz_turnos[0].replace("[", "");
		num_turnos = this.plan.datos.num_turnos;

		matriz_turnos_in = Array();

		for (var i = 0; i < matriz_turnos.length; i++) 
		{
		  turno = matriz_turnos[i].split("] ")[0];
		  turno_1 = matriz_turnos[i].split("] ")[1];
		  coordenadas = turno.split(",");
		  matriz_turnos_in[i] = { turno: coordenadas[0], hora: coordenadas[1], dia: coordenadas[2] , valor : parseFloat(turno_1)};
		}

		//////////////// dotacion real //////////////////////////////////

		dotacion_real = this.plan.datos.dotacion_real.split(", [");
		dotacion_real[0] = dotacion_real[0].replace("[", "");

		matriz_dotacion_real = Array();

		for (var i = 0; i < dotacion_real.length; i++)
		{
		  dotacion = dotacion_real[i].split("] ")[0];
		  dotacion_cantidad = dotacion_real[i].split("] ")[1];
		  coordenadas = dotacion.split(",");
		  matriz_dotacion_real[i] = {turno: coordenadas[0], x: coordenadas[1], y: coordenadas[2], cantidad: dotacion_cantidad};
		}

		//////////////////////////////////////////////////////////////////
		// sumatoria de turnos real para imprimir en la gráfica
		//////////////////////////////////////////////////////////////////

		dia = 0; // maximo  plan.datos.num_dias_ventana
		hora = 0; // máximo plan.datos.num_horas_dia

		sumatoria_turnos_real = Array(this.plan.datos.num_dias_ventana * this.plan.datos.num_horas_dia);

		for (var i = 0; i < sumatoria_turnos_real.length; i++) 
		{
		  sumatoria_turnos_real[i] = 0;
		}


		for (var i = 0; i < matriz_turnos_in.length; i++) 
		{
		  hora_turno = matriz_turnos_in[i];
		  coordenada = parseFloat((hora_turno.dia-1)*10) + parseFloat(hora_turno.hora) - 1;
		 for (var j = 0; j < matriz_dotacion_real.length; j++) 
		 {
		    if (matriz_dotacion_real[j].turno == matriz_turnos_in[i].turno)
		    {
		      sumatoria_turnos_real[coordenada] += parseFloat(matriz_dotacion_real[j].cantidad);
		    }
		  }
		}

		/////////////////////////////////////////////////////////////////
	}
	else
	{
		sumatoria_turnos_real = "";
	}	
	return sumatoria_turnos_real;
}

Cerebro.sumatoriaMatriz = function(matriz)
{
	sumatoria = 0;
	for (var i = 0; i < matriz.length; i++) 
	{
	 sumatoria += matriz[i];
	}

	return sumatoria;
}


Cerebro.calcularPerdida = function(matrixAlfaD)
{

	/////////////////////////////////////////////////////////////////
	// calcular la sumatoria por día de perdida 
	/////////////////////////////////////////////////////////////////

	diaSemana = 1;
	horasDiarias = 10;
	matrixSemanaD = new Array(num_dias_ventana);
	count = 1;
	diaMes = 0;

	for (var i = 0; i < matrixSemanaD.length; i++) 
	{
	 matrixSemanaD[i] = 0;
	}

	countDia = 0;

	for (var i = 1; i < num_horas_dia_in * num_dias_ventana + 1; i++) 
	{
	  countDia++;
	  if (matrixAlfaD[i] == undefined)
	  {
	    matrixAlfaD[i] = 0;
	  }

	  if (countDia <= num_horas_dia_in)
	  {
	    matrixSemanaD[diaMes] += parseFloat(matrixAlfaD[i]);
	  }
	  else
	  {
	    diaMes++;
	    countDia = 1;
	  }
	}

	return matrixSemanaD;
}

Cerebro.totalTurnosOptimizados = function()
{
	if (Object.keys(Cerebro.plan).length !== 0)
	{
		////////////////////////////////////////////////////////////////
		// Matriz de turnos
		////////////////////////////////////////////////////////////////

		matriz_turnos = this.plan.datos.matriz_turnos.split(", [");
		matriz_turnos[0] = matriz_turnos[0].replace("[", "");
		num_turnos = this.plan.datos.num_turnos;

		matriz_turnos_in = Array();

		for (var i = 0; i < matriz_turnos.length; i++) 
		{
		  turno = matriz_turnos[i].split("] ")[0];
		  turno_1 = matriz_turnos[i].split("] ")[1];
		  coordenadas = turno.split(",");
		  matriz_turnos_in[i] = { turno: coordenadas[0], hora: coordenadas[1], dia: coordenadas[2] , valor : parseFloat(turno_1)};
		}

		//////////////// dotacion real //////////////////////////////////

		dotacion_real = Cerebro.brainJson.resultado.turnos.split(", [");
		dotacion_real[0] = dotacion_real[0].replace("[", "");

		matriz_dotacion_real = Array();

		for (var i = 0; i < dotacion_real.length; i++)
		{
		  dotacion = dotacion_real[i].split("] ")[0];
		  dotacion_cantidad = dotacion_real[i].split("] ")[1];
		  coordenadas = dotacion.split(",");
		  matriz_dotacion_real[i] = {turno: coordenadas[0], x: coordenadas[1], y: coordenadas[2], cantidad: dotacion_cantidad};
		}

		//////////////////////////////////////////////////////////////////
		// sumatoria de turnos real para imprimir en la gráfica
		//////////////////////////////////////////////////////////////////

		dia = 0; // maximo  plan.datos.num_dias_ventana
		hora = 0; // máximo plan.datos.num_horas_dia

		sumatoria_turnos_real = Array(this.plan.datos.num_dias_ventana * this.plan.datos.num_horas_dia);

		for (var i = 0; i < sumatoria_turnos_real.length; i++) 
		{
		  sumatoria_turnos_real[i] = 0;
		}


		for (var i = 0; i < matriz_turnos_in.length; i++) 
		{
		  hora_turno = matriz_turnos_in[i];
		  coordenada = parseFloat((hora_turno.dia-1)*10) + parseFloat(hora_turno.hora) - 1;

		 for (var j = 0; j < matriz_dotacion_real.length; j++) 
		 {
		    if (matriz_dotacion_real[j].turno == matriz_turnos_in[i].turno)
		    {
		      sumatoria_turnos_real[coordenada] += parseFloat(matriz_dotacion_real[j].cantidad);
		    }
		  }
		}

		/////////////////////////////////////////////////////////////////
	}
	else
	{
		sumatoria_turnos_real = "";
	}	
	return sumatoria_turnos_real;
}

Cerebro.setearResumen = function()
{
	datosArray = Array();
	
	if ((Object.keys(Cerebro.salida).length !== 0))
	{
		salida = Cerebro.salida.split(/\n/);
		for (var i = 0; i < salida.length; i++) 
		{
			if (salida[i].includes( 'RESUMEN' ))
			{
				datos = {};
				datos.planVentas = salida[i+2].split(':')[1].trim();
				datos.deficitCobertura = salida[i+3].split(':')[1].trim();
				datos.ExcedenteCobertura = salida[i+4].split(':')[1].trim();
				datos.desviacionTotal = salida[i+5].split(':')[1].trim();
				datos.costoRemuneraciones = salida[i+6].split(':')[1].trim();
				datos.margeAjuste = salida[i+7].split(':')[1].trim();
				datosArray.push(datos);

				this.resumen = datosArray;
			}
		}
	}

	this.resumen = datosArray;
}

Cerebro.setearTurnos = function()
{
	datosArray = Array();
	
	if ((Object.keys(Cerebro.salida).length !== 0))
	{
		salida = Cerebro.salida.split(/\n/);

		if (salida.length > 1)
		{
			for (var i = 0; i < salida.length; i++) 
			{
				if (salida[i].includes( 'Turnos    Vendedores         Costo' ))
				{
					count = 1 ;
					while(count <= Cerebro.plan.datos.num_turnos)
					{
						datos = {};
						datos.turno = salida[i+count].split("          ")[0].trim();
						datos.vendedores = salida[i+count].split("          ")[1].trim();
						datos.costo = salida[i+count].split("          ")[2].trim();
						datosArray.push(datos);
						count++;
					}

					this.turnos = datosArray;
				}
			}
		}
		else
		{	
			// obtener turnos del array de entrada
			turnos = plan_enviado.datos.dotacion_real.split(", [");
			matriz_turnos[0] = matriz_turnos[0].replace("[", "");
			num_turnos = Cerebro.plan.datos.num_turnos;

			datosArray = Array();

			for (var j = 0; j < dotacion_real.length; j++)
			{
				dotacion = dotacion_real[j].split("] ")[0];
				dotacion_cantidad = dotacion_real[j].split("] ")[1];
				coordenadas = dotacion.split(",");
				datos = {};
				datos.turno = "Turno "+coordenadas[0];
				datos.vendedores = dotacion_cantidad;
				datos.costo = 0;
				datosArray.push(datos);
				count++;
			}

			this.turnos = datosArray;
		}
	}
}

Cerebro.sumatoriaTurnosDiaria = function()
{
	turnosSumatoria = new Array(this.plan.datos.num_dias_ventana);

	if (Object.keys(Cerebro.plan).length !== 0)
	{		
		totalTurnosReales = this.totalTurnosReales();
		diaSemana = 1;
		horasDiarias = 10;
		num_horas_dia_in =  this.plan.datos.num_horas_dia;
		count = 1;
		diaMes = 0;

		countDia = 1;

		for (var i = 0; i < turnosSumatoria.length; i++) 
		{
			turnosSumatoria[i] = 0;
		}

		for (var i = 0; i < totalTurnosReales.length; i++) 
		{
		  turnosSumatoria[diaMes] += parseInt(totalTurnosReales[i]);

		  if (countDia < num_horas_dia_in)
		  {
		  	countDia++;
		  }
		  else
		  {
		  	countDia = 1;
		    diaMes++;
		  }

		}
	}
	return turnosSumatoria;
}

Cerebro.sumatoriaTurnosOptimizado = function()
{
	turnosSumatoria = new Array(this.plan.datos.num_dias_ventana);

	if (Object.keys(Cerebro.plan).length !== 0)
	{		
		totalTurnosReales = this.totalTurnosOptimizados();
		diaSemana = 1;
		horasDiarias = 10;
		num_horas_dia_in =  this.plan.datos.num_horas_dia;
		count = 1;
		diaMes = 0;

		countDia = 1;

		for (var i = 0; i < turnosSumatoria.length; i++) 
		{
			turnosSumatoria[i] = 0;
		}

		for (var i = 0; i < totalTurnosReales.length; i++) 
		{
		  turnosSumatoria[diaMes] += parseInt(totalTurnosReales[i]);

		  if (countDia < num_horas_dia_in)
		  {
		  	countDia++;
		  }
		  else
		  {
		  	countDia = 1;
		    diaMes++;
		  }

		}
	}
	return turnosSumatoria;
}

Cerebro.obtenerResumen = function()
{
	return this.resumen;
}


Cerebro.save = function()
{
	data = $.ajax({ 
      type: "post",
      url: "/productivity/save_case",
      data: { result: Cerebro.brainJson, salida: Cerebro.salida, resumen: Cerebro.resumen, turnos: Cerebro.turnos, plan: plan_enviado},
      dataType: 'json',
      success: function(data)
      { 
      	location.reload();
      }
  	});

    
}