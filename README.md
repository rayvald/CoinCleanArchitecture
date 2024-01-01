# CoinCleanArchitecture

## CASOS DE USO

## Mostrar lista de cryptomonedas globales

Como usuario quiero poder consultar las crypto monedas globales ordenadas por capitalización de mercado.

GIVEN Tengo la app iniciada
WHEN accedo a la vista global
THEN veo la lista de las cryto monedas globales
AND información básica de cada crypto(nombre, símbolo, precio, cambio de precio las últimas 24h,
volumnen las últimas 24h, capitalización de mercado).

- Entities
	Cryptocurrency
		Id
		Name
		Symbol
		Price
		Price24h
		Volume24h
		MarketCap

- Use Cases
	Get global crypto list