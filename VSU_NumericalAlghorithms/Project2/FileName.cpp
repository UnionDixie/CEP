#include <cstddef>

#include <iostream>
#include <cstddef>
#include <iterator>

//template <typename T>
//class SLList
//{
//public:
//    struct Node
//    {
//        Node* next;
//        T value;
//
//        Node(Node* next = nullptr, T value = T()) :
//            next(next), value(value)
//        {}
//    };
//
//protected:
//    std::size_t msize;
//    Node* head;
//
//public:
//    SLList() :
//        msize(0), head(nullptr)
//    {}
//
//    ~SLList()
//    {
//        delete head;
//    }
//
//    SLList& push(const T& value)
//    {
//        Node* node = new Node(head, value);
//        head = node;
//        ++msize;
//        return *this;
//    }
//
//    const T& front() const
//    {
//        return head->value;
//    }
//
//    SLList& pop()
//    {
//        Node* garbage = head;
//        head = garbage->next;
//        delete garbage;
//        --msize;
//        return *this;
//    }
//
//    bool empty() const
//    {
//        return msize == 0;
//    }
//
//    std::size_t size() const
//    {
//        return msize;
//    }
//
//    class Iterator
//    {
//        Node* current;
//
//    public:
//        using iterator_category = std::input_iterator_tag;
//        using value_type = T;
//        using difference_type = std::size_t;
//        using pointer = T*;
//        using reference = T&;
//
//        Iterator(Node* current) :
//            current(current)
//        {}
//
//        Iterator& operator++()
//        {
//            current = current->next;
//            return *this;
//        }
//
//        value_type operator*() const
//        {
//            return current->value;
//        }
//
//        bool operator!=(const Iterator& iterator) const
//        {
//            return current != iterator.current;
//        }
//
//        friend class SLList;
//    };
//
//    Iterator begin()
//    {
//        return Iterator(head);
//    }
//
//    const Iterator begin() const
//    {
//        return Iterator(head);
//    }
//
//    Iterator end()
//    {
//        return Iterator(nullptr);
//    }
//
//    const Iterator end() const
//    {
//        return Iterator(nullptr);
//    }
//
//    Iterator find(const T& value) const
//    {
//        for (Iterator i = begin(); i != end(); ++i)
//        {
//            if (*i == value)
//            {
//                return i;
//            }
//        }
//        return Iterator(nullptr);
//    }
//
//    SLList& insert(Iterator i, const T& value)
//    {
//        Node* node = new Node(i.current->next, *i);
//        i.current->next = node;
//        i.current->value = value;
//        return *this;
//    }
//
//    SLList& pop(Iterator i)
//    {
//        if (i.current->next)
//        {
//            Node* garbage = i.current->next;
//            i.current->next = garbage->next;
//            delete garbage;
//        }
//        return *this;
//    }
//};
//
//template <typename T>
//class Queue
//{
//protected:
//    using Node = typename SLList<T>::Node;
//    std::size_t msize;
//    Node* tail;
//
//public:
//    Queue() :
//        msize(0), tail(new Node())
//    {
//        tail->next = tail;
//    }
//
//    ~Queue()
//    {
//        Node* i = tail;
//        do
//        {
//            Node* garbage = i;
//            i = i->next;
//            delete garbage;
//        } while (i != tail);
//    }
//
//    Queue& push(const T& value)
//    {
//        tail->value = value;
//        tail->next = new Node(tail->next);
//        tail = tail->next;
//        ++msize;
//        return *this;
//    }
//
//    const T& front() const
//    {
//        return tail->next->value;
//    }
//
//    Queue& pop()
//    {
//        Node* garbage = tail->next;
//        tail->next = garbage->next;
//        delete garbage;
//        --msize;
//        return *this;
//    }
//
//    std::size_t size() const
//    {
//        return msize;
//    }
//
//    bool empty() const
//    {
//        return msize == 0;
//    }
//};

template <typename T>
class BTree
{
public:
    struct Node
    {
        T value;
    };

    //enum IteratorType {
    //};

    template <Node>
    class Iterator
    {
    public:
        struct INode
        {
        public:
            INode(Node a);
        };
    };
};

int main(int argc, char* argv[])
{
    BTree<float> t;

    return 0;
}

//template<typename T>
//template <typename BTree<T>::IteratorType IType>
//BTree<T>::Iterator<IType>::INode::INode(Node* mnode, int mlevel)
//{
//}

template<typename T>
template<typename BTree<T>::Node node>
BTree<T>::template Iterator<node>::INode::INode(template BTree<T>::Node a)
{
}
