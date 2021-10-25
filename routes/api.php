<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

//Route::get('clientes', 'App\Http\Controllers\Api\BuscaSchoolApiController@index');
Route::get('alunos', 'App\Http\Controllers\Api\BuscaSchoolApiController@index');
//$this->apiResource('alunos', 'Api\BuscaShoolApiController');