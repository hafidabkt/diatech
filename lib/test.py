from fastapi import FastAPI

app = FastAPI()

@app.get("/")
async def read_root():
    return {"message": "Hello from FastAPI!"}

@app.get("/api/data")
async def get_data():
    data = {
        "message": "Hello from FastAPI API!"
    }
    return data
