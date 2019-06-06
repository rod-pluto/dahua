<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


/**
 * Rotas Públicas
 */
Route::group(['namespace' => 'Web'],function( $web ) {
    $web->get('/', 'HomeController@index')->name('web.home');

    /** Quero ser um parceiro */
    $web->get('quero-ser-um-parceiro', 'PartnersController@create')->name('web.partner.create');
    $web->post('quero-ser-um-parceiro', 'PartnersController@store')->name('web.partner.store');
});

/** Rotas de autenticação */
Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

/** Painel Administrativo */
Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
