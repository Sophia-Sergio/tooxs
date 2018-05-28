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

Calculo.exceso = function(prod_obj, matriz)
{
	var exceso = 0;
	for (var i = 0; i < matriz.length; i++) 
	{
		if ((matriz[i] - prod_obj) > 0)
		{
			exceso += matriz[i];
		}	
	}

	exceso = Math.round(exceso / prod_obj)

	return fn.formateaNumero(exceso);
}

Calculo.faltante = function(prod_obj, matriz)
{
	var faltante = 0;
	for (var i = 0; i < matriz.length; i++) 
	{
		if ((matriz[i] - prod_obj) < 0)
		{
			faltante += matriz[i];
		}	
	}
	faltante = Math.round(faltante / prod_obj)

	return fn.formateaNumero(faltante);
}