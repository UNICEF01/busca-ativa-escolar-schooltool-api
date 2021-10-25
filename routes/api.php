<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

//Route::get('clientes', 'App\Http\Controllers\Api\BuscaSchoolApiController@index');
//Route::get('alunos', 'App\Http\Controllers\Api\BuscaSchoolApiController@index');
Route::apiResource('alunos', 'App\Http\Controllers\Api\BuscaSchoolApiController');