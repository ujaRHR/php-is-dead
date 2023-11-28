<?php

namespace App\Http\Middleware\Demo;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class ResponseEditorMiddleware
{
    public function handle(Request $request, Closure $next): Response
    {
        $response = $next($request);
        $response->setContent("Injected Response via the ResponseEditor Middleware");
        return $response;
        
    }
}
