from fastapi import FastAPI
import uvicorn
import socket

app = FastAPI()

@app.get("/")
def read_root():
    pod_name = socket.gethostname()
    return {
        "message": "Hello World",
        "handled_by_pod": pod_name
    }

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=32777)