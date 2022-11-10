<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PostController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\RoleController;
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
Route::get('/', function(){
    return redirect('view');
});
Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
Route::get('/view', [\App\Http\Controllers\HomeController::class, 'view']);
Route::get('/view/{id}', [\App\Http\Controllers\HomeController::class,'view_post'])->name('view.post')->middleware('filter');;
Route::get('/view_cate/{id}', [\App\Http\Controllers\HomeController::class, 'view_cate'])->name('view.cate');
Route::post('/ud_comment/{id}', [\App\Http\Controllers\CommentController::class, 'ud_comment'])->name('ud.comment');
Route::post('/post_comment/{id}', [\App\Http\Controllers\CommentController::class, 'post_comment'])->name('post.comment');
Auth::routes();

Route::group(['prefix' => 'admin', 'middleware' => 'auth'], function () {
    Route::get('/add_post', [PostController::class, 'add_post']);
    Route::post('/add_post', [PostController::class, 'add_post']);
    Route::get('/edit/{id}', [PostController::class,'edit']);
    Route::get('/delete/{id}', [PostController::class, 'delete']);
    Route::post('/edit/{id}', [PostController::class, 'edit']);
    Route::get('/post/{id}',[PostController::class, 'read']);
    Route::get('/role', [RoleController::class, 'index']);
    Route::get('/delete_user/{id}',[RoleController::class,'delete_user']);
    Route::get('/edit_user/{id}',[RoleController::class,'edit_user']);
    Route::post('/edit_user/{id}',[RoleController::class,'edit_user']);
    Route::get('/category', [CategoryController::class,'index']);
    Route::get('/edit_cate', [CategoryController::class,'edit']);
    Route::get('/delete_cate/{id}', [CategoryController::class, 'delete']);
    Route::post('/category', [CategoryController::class,'create'])->name('add.cate');
});
