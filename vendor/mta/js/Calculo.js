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