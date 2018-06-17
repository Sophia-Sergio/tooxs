var Calculo = {};

Calculo.semanal = function(datos, dias)
{
	semanasCount = 0
	diasCount = 1

	arraySemana = Array();

	for (var i = 0; i < datos.length; i++) 
	{

		if (arraySemana[semanasCount] == undefined)
		{
			arraySemana[semanasCount] = 0;
		}

		arraySemana[semanasCount] += parseInt(datos[i]);

		if (diasCount < dias)
		{
			diasCount++;
		}
		else
		{
			diasCount = 1;
			semanasCount++;
		}
	}
	return arraySemana;
}

Calculo.excesoTotal = function(matriz)
{
	var exceso = 0;
	for (var i = 0; i < matriz.length; i++) 
	{
		if (matriz[i] >= 0)
		{
			exceso += matriz[i];
		}	
	}

	return exceso;
}

Calculo.faltanteTotal = function(matriz)
{
	var exceso = 0;
	for (var i = 0; i < matriz.length; i++) 
	{
		if (matriz[i] < 0)
		{
			exceso += matriz[i];
		}	
	}

	return exceso;
}

Calculo.matrizExceso = function(prod_obj, matriz, dotacion)
{
	var exceso = 0;
	var matrizSet = [];

	for (var i = 0; i < matriz.length; i++) 
	{
		matrizSet[i] = Math.round(((matriz[i] - prod_obj) * dotacion[i]) / prod_obj);
	}

	return matrizSet;
}
