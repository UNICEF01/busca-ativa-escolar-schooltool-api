<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


Route::get('v1/alertas', 'App\Http\Controllers\Api\BuscaSchoolApiController@index');