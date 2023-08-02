using System;
using System.Collections.Generic;

public class CircularBuffer<T>
{
    #region fields
    private readonly int _capacity;
    private readonly Queue<T> _queue = new();
    #endregion

    #region constructors
    public CircularBuffer(int capacity) => _capacity = capacity;
    #endregion

    #region methods
    public T Read() 
        => _queue.Count == 0 ? throw new InvalidOperationException() : _queue.Dequeue();

    public void Write(T value)
    {
        if (_queue.Count < _capacity) _queue.Enqueue(value);
        else
            throw new InvalidOperationException();
    }

    public void Overwrite(T value)
    {
        if (_queue.Count >= _capacity)
        {
            _queue.Dequeue(); 
        }
        _queue.Enqueue(value);
    }

    public void Clear() 
        => _queue.Clear();
    #endregion
}