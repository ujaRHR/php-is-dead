<?php

namespace App\Http\Middleware\Demo;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class CountryBlockerMiddleware
{
    public function handle(Request $request, Closure $next): Response
    {
        // Usefull for Production
        return $next($request);
    }
}
