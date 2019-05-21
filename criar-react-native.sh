#!/bin/bash

RED='\033[1;31m'

GREEN='\033[1;32m'

NC='\033[0m'

echo -e " ${GREEN} CRIANDO A APLICAÇÃO ${NC} "

if ! react-native init $1 
then
	echo -e " ${RED} Erro ao criar a aplicação ${NC} "
	exit 1 
fi

echo ""
echo -e " ${GREEN} Aplicação criada com sucesso ${NC} "
echo ""

cd "$1/"

echo ""
echo ""
echo -e " ${GREEN} Utilizar Requisições HTTP S/N ? ${NC} "
read resp

if [ $resp == "S" ] || [ $resp == "s" ]; then
	echo " "
	echo -e " ${GREEN} Instalando axios ${NC} "
	npm install axios --save
fi

echo ""
echo -e " ${GREEN} Instalando react navigation ${NC} "
npm install react-navigation --save
npm install react-native-gesture-handler@~1.0.14 --save
react-native link react-native-gesture-handler

echo ""
echo -e " ${GREEN} Instalando vector icons ${NC} "
npm install react-native-vector-icons --save
react-native link react-native-vector-icons

echo ""
echo -e " ${GREEN} Instalando popup menu ${NC} "
npm install react-native-popup-menu-android --save
echo ""
echo -e " ${GREEN} Instalando  eslint e seus plugins ${NC} "
npm install eslint --save-dev
npm install eslint-plugin-react --save-dev
npm install eslint-plugin-react-native --save-dev
npm install eslint-config-standard --save-dev
npm install eslint-config-standard-react --save-dev
npm install eslint-plugin-standard --save-dev
npm install eslint-plugin-import --save-dev
npm install eslint-plugin-node --save-dev
npm install eslint-plugin-promise --save-dev
npm install babel-eslint --save-dev
./node_modules/.bin/eslint --init

[ -e .eslintrc.js ] && rm .eslintrc.js

echo 'module.exports = {
    "env": {
        "browser": true,
        "es6": true,
        "jest": true,
        "react-native/react-native": true,
    },
        "extends": [
            "eslint:recommended",
            "plugin:react/recommended"
    ],
    "parser":"babel-eslint",
    "parserOptions": {
        "ecmaFeatures": {
            "jsx": true
        },
        "ecmaVersion": 2015,
        "sourceType": "module"
    },
    "plugins": [
        "react",
        "react-native"
    ],
    "rules": {
        "indent": [
            "warn",
            "tab"
        ],
        "linebreak-style": [
            "warn",
            "unix"
        ],
        "quotes": [
            "warn",
            "single"
        ],
        "semi": [
            "warn",
            "always"
        ],
        "react/jsx-uses-vars": [2],
        "react/prop-types": "off",
        "no-use-before-define": "off",
                
    }
};' >> .eslintrc.js

mkdir -p src/components
mkdir -p src/routes
mkdir -p src/pages
mkdir -p src/styles

echo ""
echo ""
echo -e " ${GREEN} A aplicação irá trabalhar com redux S/N  ? ${NC} "
read resp 

if [ $resp == "S" ] || [ $resp == "s" ]; then
	echo -e " ${GREEN} Configurando REDUX ${NC} "
	mkdir -p src/actions
	mkdir -p src/reducers
	mkdir -p src/store
	npm install redux --save
	npm install react-redux --save
	npm install redux-thunk --save
	npm install redux-persist
	npm install remote-redux-devtools --save-dev
fi	

echo ""
echo -e " ${GREEN} O ambiente de desenvolvimento foi configurado ${NC} "

echo ""
echo ""
echo -e " ${GREEN} Deseja rodar seu aplicativo S/N ? ${NC} "
read rodar

if [ $rodar == "S" ] || [ $rodar == "s" ]; then
        react-native run-android
fi	
