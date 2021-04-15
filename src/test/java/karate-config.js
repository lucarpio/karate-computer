function fn() {
	// get system property 'karate.env'
	var env = karate.env;

	// Environment Default
	if (!env) {
		env = 'qa';
	}

	var config = {
		/* -------------------------- PATHS -------------------------- */
		path_user: '/v2/user',
		path_pet: '/v2/pet',
		baseUrl: 'https://computer-database.gatling.io',

		//API PETS
		petUrl: '',

		// POKEMON
		pokeUrl: 'https://app-mipokemon.herokuapp.com',
		pokeRegistroBtn: '/html/body/header/nav/div/div/ul/li[5]/a',
		pokeUserInput: '#username',
		pokePwdInput: '#pwd',
		pokeNomInput: '#Nombre',
		pokeApeInput: '#Apellido',
		pokeNacInput: '#FecNac',
		pokePuebSelect: '#PuebloId',
		pokeRegSubmit: '/html/body/div/main/div/div/form/div[7]/button'

	}

	/* -------------------------- SETTINGS -------------------------- */

	config.ambiente = karate.call('core/environment/config-' + env + '.js');
	config.constants = karate.call('core/constants/constants.js');

	karate.log('karate.env system property was:', env);

	return config;
}
