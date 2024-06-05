from fastapi import FastAPI, HTTPException
from fastapi.responses import JSONResponse

app = FastAPI()

@app.get("/search")
async def search(query: str = None):
    if not query:
        raise HTTPException(status_code=400, detail="Query parameter is missing")
    
    # Perform any operation with the query here (e.g., logging, search, etc.)
    
    # Respond with a thank you message
    return JSONResponse(content={"message": "Thank you"})

if __name__ == '__main__':
    import uvicorn
    uvicorn.run(app, host="127.0.0.1", port=8000)
