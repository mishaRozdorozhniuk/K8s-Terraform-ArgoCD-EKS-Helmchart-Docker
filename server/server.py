from fastapi import FastAPI

app = FastAPI()

@app.get("/")
async def root():
    return {"status": "OK", "code": 200}

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
