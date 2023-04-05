package task3v6;

import java.util.*;
import java.util.concurrent.Semaphore;

public class MySyncMap<K, V> implements Map<K, V> {

    private volatile Map<K, V> map = new HashMap<>();

    private Semaphore semaphore = new Semaphore(1, true);

    @Override
    public int size() {
        int size = 0;
        try {
            semaphore.acquire();
            size = map.size();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } finally {
            semaphore.release();
        }
        return  size;
    }

    @Override
    public boolean isEmpty() {
        boolean emptiness = true;

        try {
            semaphore.acquire();
            emptiness = map.isEmpty();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }finally {
            semaphore.release();
        }
        return emptiness;
    }

    @Override
    public boolean containsKey(Object key) {
        boolean temp = false;
        try {
            semaphore.acquire();
            temp = map.containsKey(key);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }finally {
            semaphore.release();
        }
        return  temp;
    }

    @Override
    public boolean containsValue(Object value) {
        boolean temp = false;
        try {
            semaphore.acquire();
            temp = map.containsValue(value);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }finally {
            semaphore.release();
        }
        return  temp;
    }

    @Override
    public V get(Object key) {
        V res = null;
        try {
            semaphore.acquire();
            res = map.get(key);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }finally {
            semaphore.release();
        }
        return  res;
    }

    @Override
    public V put(K key, V value) {
        V res = null;;
        try {
            semaphore.acquire();
            res = map.put(key, value);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }finally {
            semaphore.release();
        }
        return  res;
    }

    @Override
    public V remove(Object key) {
        V res = null;
        try {
            semaphore.acquire();
            res = map.remove(key);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }finally {
            semaphore.release();
        }
        return  res;
    }

    @Override
    public void putAll(Map<? extends K, ? extends V> m) {
        try {
            semaphore.acquire();
            map.putAll(m);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }finally {
            semaphore.release();
        }
    }

    @Override
    public void clear() {
        try {
            semaphore.acquire();
            map.clear();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }finally {
            semaphore.release();
        }
    }

    @Override
    public Set<K> keySet() {
        Set<K> res = null;
        try {
            semaphore.acquire();
            res = map.keySet();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }finally {
            semaphore.release();
        }
        return  res;
    }

    @Override
    public Collection<V> values() {
        Collection<V> res = null;
        try {
            semaphore.acquire();
            res = map.values();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }finally {
            semaphore.release();
        }
        return  res;
    }

    @Override
    public Set<Entry<K, V>> entrySet() {
        Set<Entry<K,V>> res = null;
        try {
            semaphore.acquire();
            res = map.entrySet();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }finally {
            semaphore.release();
        }
        return  res;
    }
}
