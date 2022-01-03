<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


Route::get('v1/alertas', 'App\Http\Controllers\Api\BuscaSchoolApiController@returnChildren');
Route::put('v1/alertas/{alert_id}', 'App\Http\Controllers\Api\ResearchAlertController@update');