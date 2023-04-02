package task3v6;

import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class MySyncSet<E> implements Set<E> {

    private static final Lock lock = new ReentrantLock();

    private volatile Set<E> set = new HashSet<>();

    @Override
    public int size() {
        int size = 0;
        lock.lock();
        size = set.size();
        lock.unlock();

        return size;
    }

    @Override
    public boolean isEmpty() {
        boolean emptiness = false;
        lock.lock();
        emptiness = set.isEmpty();
        lock.unlock();
        return emptiness;
    }

    @Override
    public boolean contains(Object o) {
        boolean res = false;
        lock.lock();
        res = set.contains(o);
        lock.unlock();
        return res;
    }

    @Override
    public Iterator<E> iterator() {
        Iterator<E> iterator = null;
        lock.lock();
        iterator = set.iterator();
        lock.unlock();
        return iterator;
    }

    @Override
    public Object[] toArray() {
        Object[] objects = new Object[]{};
        lock.lock();
        objects = set.toArray();
        lock.unlock();
        return objects;
    }

    @Override
    public <T> T[] toArray(T[] a) {
        Object[] objects = new Object[]{};
        lock.lock();
        objects = set.toArray();
        lock.unlock();
        return (T[]) objects;
    }


    @Override
    public boolean add(E e) {
        boolean status = false;
        lock.lock();
        status = set.add(e);
        lock.unlock();
        return status;
    }

    @Override
    public boolean remove(Object o) {
        boolean status = false;
        lock.lock();
        status = set.remove(o);
        lock.unlock();

        return status;
    }

    @Override
    public boolean containsAll(Collection<?> c) {
        boolean status = false;
        lock.lock();
        status = set.containsAll(c);
        lock.unlock();
        return status;

    }

    @Override
    public boolean addAll(Collection<? extends E> c) {
        boolean status = false;
        lock.lock();
        status = set.addAll(c);
        lock.unlock();
        return status;
    }

    @Override
    public boolean retainAll(Collection<?> c) {
        boolean status = false;
        lock.lock();
        status = set.retainAll(c);
        lock.unlock();
        return status;
    }

    @Override
    public boolean removeAll(Collection<?> c) {
        boolean status = false;
        lock.lock();
        status = set.removeAll(c);
        lock.unlock();
        return status;
    }

    @Override
    public void clear() {
        lock.lock();
        set.clear();
        lock.unlock();
    }
}
